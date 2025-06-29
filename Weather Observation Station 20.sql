SELECT ROUND(LAT_N, 4) AS Median_LAT_N
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowAsc,
           ROW_NUMBER() OVER (ORDER BY LAT_N DESC) AS RowDesc
    FROM STATION
) AS numbered
WHERE RowAsc = RowDesc OR RowAsc + 1 = RowDesc OR RowDesc + 1 = RowAsc;
