create TABLE Person(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    login VARCHAR(200),
    email VARCHAR(200),
    password VARCHAR(200),  
    isAdmin BOOLEAN
);

create TABLE Program(
    PersonID INTEGER,
    structure TEXT,
    name VARCHAR(200),
    description VARCHAR(200),
    FOREIGN KEY (PersonID) REFERENCES Person (id)
);

create TABLE Robot(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description VARCHAR(200),
    PersonID INTEGER,
    RobotSettings INTEGER,
    FOREIGN KEY (PersonID) REFERENCES Person (id),
    UNIQUE (RobotSettings)
);

create TABLE Map(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    PersonID INTEGER,
    structure TEXT,
    FOREIGN KEY (PersonID) REFERENCES Person (id),
    UNIQUE (name)
);

create TABLE RobotSettings(
    name VARCHAR(200),
    description VARCHAR(200),
    PersonID INTEGER,
    RobotSettingsID INTEGER,
    FOREIGN KEY (RobotSettingsID) REFERENCES Robot (RobotSettings),
    LeftEngine FLOAT,
    RightEngine FLOAT,
    FrontSensor FLOAT,
    BackSensor FLOAT,
    LeftSensor FLOAT,
    RightSensor FLOAT
);

create TABLE Settings(
    PersonID INTEGER,
    FOREIGN KEY (PersonID) REFERENCES Person (id),
    Start TEXT,
    Pause TEXT,
    Restart TEXT,
    Forward TEXT,
    Left_left TEXT,
    Back TEXT,
    Rigth TEXT
);