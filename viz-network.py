"""
This script generates the dotfile for the brass birmingham map.
"""
import sqlite3
import sys

input_db = sys.argv[1]
output_file = sys.argv[2]

subgraph_template = """
subgraph cluster_{cluster_name} {{
    label = "{cluster_name}";
    style=filled;
    color=lightgrey;
    {node_list}
}}
"""

node_template = """
    {node_name} [label="{node_label}"];
"""

edge_template = """
    {node1} -- {node2} [label="{label}"];
"""

# open connection to database
conn = sqlite3.connect(input_db)
c = conn.cursor()
c.execute("SELECT location,ordinal,type FROM slots")
slots = c.fetchall()
c.execute("SELECT location1,location2 FROM canals")
canals = c.fetchall()
c.execute("SELECT location1,location2,player FROM boats")
boats = c.fetchall()

# get unique locations
locations = set()
for slot in slots:
    locations.add(slot[0])
# each location is a cluster

subgraphs = []
for location in locations:
    nodes = node_template.format(node_name=location, node_label=location)
    for slot in slots:
        if slot[0] == location:
            name = slot[0] + str(slot[1])
            label = slot[2]
            nodes += node_template.format(node_name=name, node_label=label)
    sg = subgraph_template.format(cluster_name=location, node_list=nodes)
    subgraphs.append(sg)
subgraphs = "\n".join(subgraphs)
edges = []
for canal in canals:
    edges.append(edge_template.format(node1=canal[0], node2=canal[1], label=""))
for boat in boats:
    edges.append(edge_template.format(node1=boat[0], node2=boat[1], label=boat[2]))
edges = "".join(edges)

def dot_file(subgraphs, edges):
    return "graph G {" + subgraphs + "\n" + edges + "\n" + "}"

with open(output_file, "w") as f:
    f.write(dot_file(subgraphs, edges))
