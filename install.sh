#!/bin/sh

cp target/release/libmgawika.so `pg_config --libdir`/postgresql/mgawika.so
cp control/*.control sql/*.sql `pg_config --sharedir`/extension
