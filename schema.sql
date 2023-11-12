--
-- File generated with SQLiteStudio v3.4.4 on Fri Nov 17 09:14:22 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: boats
DROP TABLE IF EXISTS boats;

CREATE TABLE IF NOT EXISTS boats (
    Location1 TEXT,
    Location2 TEXT,
    Player    INTEGER,
    UNIQUE (
        Location1,
        Location2,
        Player
    )
);

INSERT INTO boats (
                      Location1,
                      Location2,
                      Player
                  )
                  VALUES (
                      'a',
                      'b',
                      1
                  );


-- Table: canals
DROP TABLE IF EXISTS canals;

CREATE TABLE IF NOT EXISTS canals (
    Location1 TEXT NOT NULL,
    Location2 TEXT NOT NULL
);

INSERT INTO canals (
                       Location1,
                       Location2
                   )
                   VALUES (
                       'a',
                       'b'
                   );

INSERT INTO canals (
                       Location1,
                       Location2
                   )
                   VALUES (
                       'b',
                       'c'
                   );

INSERT INTO canals (
                       Location1,
                       Location2
                   )
                   VALUES (
                       'a',
                       'd'
                   );

INSERT INTO canals (
                       Location1,
                       Location2
                   )
                   VALUES (
                       'd',
                       'e'
                   );


-- Table: cards
DROP TABLE IF EXISTS cards;

CREATE TABLE IF NOT EXISTS cards (
    Location      TEXT,
    Industry1     TEXT,
    Industry2     TEXT,
    AllIndustries INTEGER DEFAULT 0,
    AllLocations  INTEGER DEFAULT 0,
    Player        INTEGER
);

INSERT INTO cards (
                      Location,
                      Industry1,
                      Industry2,
                      AllIndustries,
                      AllLocations,
                      Player
                  )
                  VALUES (
                      'a',
                      NULL,
                      NULL,
                      NULL,
                      NULL,
                      1
                  );


-- Table: factories
DROP TABLE IF EXISTS factories;

CREATE TABLE IF NOT EXISTS factories (
    Location  TEXT,
    Ordinal   INTEGER,
    Type      TEXT,
    Level     INTEGER,
    Coal      INTEGER,
    Iron      INTEGER,
    Beer      INTEGER,
    BeerPrice INTEGER,
    Player    TEXT,
    Flipped   INTEGER DEFAULT (0) 
);

INSERT INTO factories (
                          Location,
                          Ordinal,
                          Type,
                          Level,
                          Coal,
                          Iron,
                          Beer,
                          BeerPrice,
                          Player,
                          Flipped
                      )
                      VALUES (
                          'd',
                          1,
                          'coal',
                          1,
                          3,
                          0,
                          0,
                          0,
                          '1',
                          0
                      );


-- Table: inventory
DROP TABLE IF EXISTS inventory;

CREATE TABLE IF NOT EXISTS inventory (
    Type         TEXT,
    Level        INTEGER,
    Quantity     INTEGER,
    Price        INTEGER,
    CoalPrice    INTEGER,
    IronPrice    INTEGER,
    CoalProvided INTEGER,
    IronProvided INTEGER,
    BeerPrice    INTEGER,
    BeerProvided INTEGER,
    CanDevelop   INTEGER DEFAULT 1,
    Player       INTEGER
);

INSERT INTO inventory (
                          Type,
                          Level,
                          Quantity,
                          Price,
                          CoalPrice,
                          IronPrice,
                          CoalProvided,
                          IronProvided,
                          BeerPrice,
                          BeerProvided,
                          CanDevelop,
                          Player
                      )
                      VALUES (
                          'coal',
                          1,
                          1,
                          5,
                          0,
                          0,
                          3,
                          0,
                          0,
                          0,
                          1,
                          1
                      );


-- Table: players
DROP TABLE IF EXISTS players;

CREATE TABLE IF NOT EXISTS players (
    [Order] INTEGER,
    Money   INTEGER,
    Player  INTEGER
);

INSERT INTO players (
                        [Order],
                        Money,
                        Player
                    )
                    VALUES (
                        2,
                        17,
                        2
                    );

INSERT INTO players (
                        [Order],
                        Money,
                        Player
                    )
                    VALUES (
                        1,
                        17,
                        1
                    );


-- Table: slots
DROP TABLE IF EXISTS slots;

CREATE TABLE IF NOT EXISTS slots (
    Location TEXT,
    Ordinal  INTEGER,
    Type     TEXT,
    UNIQUE (
        Location,
        Ordinal,
        Type
    )
);

INSERT INTO slots (
                      Location,
                      Ordinal,
                      Type
                  )
                  VALUES (
                      'd',
                      1,
                      'coal'
                  );

INSERT INTO slots (
                      Location,
                      Ordinal,
                      Type
                  )
                  VALUES (
                      'a',
                      1,
                      'coal'
                  );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
