import db from "#db/client";

export async function createRoutine(userId, name, description) {
  const sql = `
    INSERT INTO routines
        (user_id, name, description, created_at)
    VALUES
        ($1, $2, $3, CURRENT_DATE)
    RETRUNING *`;
  const {
    rows: [routine],
  } = await db.query(sql, [userId, name, description]);
  return routine;
}
