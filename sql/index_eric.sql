CREATE INDEX Calendar_idx
ON Listing_Calendar (extract(YEAR FROM cdate), available);

CREATE INDEX Calendar_idx_2
ON Listing_Calendar (extract(YEAR FROM cdate));

CREATE INDEX Calendar_idx_lst
ON Listing_Calendar (listing_id);

CREATE INDEX HOST_VERIFICATION_IDX
ON HOST_VERIFICATION (HOST_VERIFICATION);

CREATE INDEX CANCELLATION_POLICY
ON CANCELLATION_POLICY (CANCELLATION_POLICY);

CREATE INDEX LISTING_SCORE_BEDS_IDX
ON LISTING (beds, REVIEW_SCORES_RATING);

DROP INDEX LISTING_SCORE_BEDS_IDX;
DROP INDEX CANCELLATION_POLICY;
DROP INDEX Calendar_idx;
