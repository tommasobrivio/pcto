using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Palestra
{
    public class Utilities
    {
        private SqlConnection conn;
        public Utilities() {
        
        }

        public Utilities(SqlConnection c)
        {
            conn = c;
        }

        public int GetContatore(String table)
        {
            String query = "SELECT * FROM Contatori WHERE Tabella='"+table+"'";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(dr);
            if (dataTable.Rows.Count == 0)
            {
                String query2 = "INSERT INTO Contatori (Tabella, Contatore) VALUES (@Tabella, @Contatore)";
                SqlCommand comm = new SqlCommand(query2, conn);
                comm.Parameters.AddWithValue("@Tabella", table);
                comm.Parameters.AddWithValue("@Contatore", 1);
                comm.ExecuteNonQuery();
                return 1;
            }

            else
            {
                foreach (DataRow i in dataTable.Rows)
                {
                    if (i.ItemArray[0].ToString() == table)
                    {
                        return Int32.Parse(i.ItemArray[1].ToString()) + 1;
                    }
                }
            }
            return 0;
        }
        public void SetContatore(String table, int cont)
        {
            SqlCommand comm = new SqlCommand("UPDATE Contatori SET Contatore=@Contatore WHERE Tabella='"+table+"'", conn);
            comm.Parameters.AddWithValue("@Contatore", cont);
            comm.ExecuteNonQuery();
        }

        public DataTable GetAll(String table)
        {
            DataTable dataTable = new DataTable();
            String query = "SELECT * FROM " + table;
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);

            return dataTable;
        }

        public String GetRecord(String table, int i, String condizione)
        {
            DataTable dataTable = new DataTable();
            
            String query = "SELECT * FROM " + table + " WHERE "+condizione+i;
            
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);

            String ris = "";
            foreach (DataRow j in dataTable.Rows)
            {
                for (int k = 0; k < j.ItemArray.Length; k++)
                {
                    ris+=j.ItemArray[k].ToString()+";";

                }

            }
            return ris;
        }

        public String GetRecordByName(String table, String n, String condizione)
        {
            DataTable dataTable = new DataTable();

            String query = "SELECT * FROM " + table + " WHERE " + condizione + n;

            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);

            String ris = "";
            foreach (DataRow j in dataTable.Rows)
            {
                for (int k = 0; k < j.ItemArray.Length; k++)
                {
                    ris += j.ItemArray[k].ToString() + ";";

                }

            }
            return ris;
        }

        public void Delete(String table, int id, String condizione)
        {
            String query = "DELETE FROM " + table + " WHERE " + condizione + id;
            SqlCommand comm = new SqlCommand(query, conn);

            comm.ExecuteNonQuery();
        }

        public DataTable GetInnerJoin(String t1, String t2, String t3, String condizione)
        {
            DataTable dataTable = new DataTable();

            String query = "SELECT "+t2+".Nome, "+t2+ ".Cognome, " + t3 + ".NomeCorso FROM " + t1 + " INNER JOIN " + t2 + " ON " 
                + t1 + ".IdIscritto=" + t2 + ".IdIscritto" +
                " INNER JOIN " + t3 + " ON " + t1 + ".IdCorso=" + t3 + ".IdCorso WHERE 1=1 "+condizione;

            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);

            return dataTable;
        }
    }
}
