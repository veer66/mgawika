CREATE FUNCTION mgawika_start(internal, int4)
RETURNS internal
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE FUNCTION mgawika_get_token(internal, internal, internal)
RETURNS internal
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE FUNCTION mgawika_end(internal)
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE TEXT SEARCH PARSER mgawika (
    START    = mgawika_start,
    GETTOKEN = mgawika_get_token,
    END      = mgawika_end,
    HEADLINE = pg_catalog.prsd_headline,
    LEXTYPES = prsd_lextype
);
