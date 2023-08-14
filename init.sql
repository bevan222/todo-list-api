CREATE DATABASE todolist;

\c todolist

CREATE TABLE "tasks" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "task_name" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "duedate" timestamp,
  "creator_id" integer NOT NULL,
  "complete" boolean,
  "description" varchar
);

CREATE TABLE "users" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "username" varchar UNIQUE NOT NULL
);

CREATE TABLE "comments" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "message" varchar NOT NULL,
  "creator_id" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "belong_task_id" integer NOT NULL
);

CREATE TABLE "task_history" (
  "task_id" integer,
  "task_name" varchar NOT NULL,
  "created_at" timestamp,
  "duedate" timestamp,
  "creator_id" integer NOT NULL,
  "complete" boolean,
  "description" varchar,
  "mod_time" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "alert_list" (
  "user_id" integer NOT NULL,
  "task_id" integer NOT NULL
);

ALTER TABLE "task_history" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id");

ALTER TABLE "tasks" ADD FOREIGN KEY ("creator_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("creator_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("belong_task_id") REFERENCES "tasks" ("id");

ALTER TABLE "alert_list" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "alert_list" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id");

insert into users(username) values('bevan');

insert into users(username) values('harry');