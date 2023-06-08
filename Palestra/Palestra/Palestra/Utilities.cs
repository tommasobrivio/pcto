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
                return 1;

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

        public List<String> GetAll(String table)
        {
            DataTable dataTable = new DataTable();
            String query = "SELECT * FROM" + table;
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);

            List<String> ris = new List<string>();
            foreach(DataRow i in dataTable.Rows)
            {
                for(int k=0;k< i.ItemArray.Length; k++)
                {
                    ris.Add(i.ItemArray[k].ToString());
                    
                }
                
            }
            return ris;
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
    }
}
