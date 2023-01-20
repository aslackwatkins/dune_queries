SELECT
    date_trunc('day',e.evt_block_time),
    COUNT(*)
FROM transfers_ethereum.eth t 
INNER JOIN erc721_ethereum.evt_Transfer e 
    ON t.tx_from = e.to
WHERE e."from" ='0x0000000000000000000000000000000000000000'
    AND e.evt_block_time < NOW()
    AND e.evt_block_time >= date_add('day',-90,NOW())
    AND t.value_decimal < 0.1
    AND t.value_decimal >= 0.01
GROUP BY 1