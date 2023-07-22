SELECT e.name AS event, e.starts_at, sections.name AS section, s.row, s.number AS seat 
  FROM tickets AS t
  INNER JOIN customers AS c
    on t.customer_id = c.id
  INNER JOIN events as e
    on t.event_id = e.id
  INNER JOIN seats as s
    on t.seat_id = s.id
  INNER JOIN sections
    on s.section_id = sections.id
  WHERE c.email = 'gennaro.rath@mcdermott.co';