-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION mgawika" to load this file. \quit

ALTER EXTENSION mgawika ADD function mgawika_start(internal,integer);
ALTER EXTENSION mgawika ADD function mgawika_get_token(internal,internal,internal);
ALTER EXTENSION mgawika ADD function mgawika_end(internal);
ALTER EXTENSION mgawika ADD text search parser mgawika;
