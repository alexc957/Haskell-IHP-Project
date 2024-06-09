CREATE TABLE "Users" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    username TEXT NOT NULL
);
