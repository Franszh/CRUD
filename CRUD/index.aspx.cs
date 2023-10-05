using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class index : System.Web.UI.Page
    {

        String[] encabezados1 = { "Descripcion" };
        String[] encabezados2 = { "Monto", "tipo", "Descripcion" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                CompletarTabla(Table1, SqlDSTabla1, encabezados1);
                CompletarTabla(Table2, SqlDSTabla2, encabezados2);
            }
            
            
        }

        protected void btn1CargarCuenta_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            CompletarTabla(Table1,SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);

        }
        protected void EliminarCuenta_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);
        }



        protected void CargarRegistro_Click(object sender, EventArgs e)
        {
            int result = sqlDataSource2.Insert();
            if (result > 0) {
                CompletarTabla(Table2, SqlDSTabla2, encabezados2);
                CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            }
            
        }

        protected void EliminarRegistro_Click(object sender, EventArgs e)
        {
            sqlDataSource2.Delete();
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);
            
        }




        private void CompletarTabla(Table tabla, SqlDataSource fuenteDatos, string[] encabezados)
        {
            try
            {
                DataView dv = (DataView)fuenteDatos.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    TableRow header = new TableRow();

                    foreach (string encabezado in encabezados)
                    {
                        TableCell headerCell = new TableCell();
                        headerCell.Text = encabezado;
                        header.Cells.Add(headerCell);
                    }

                    tabla.Rows.Add(header);

                    foreach (DataRowView rv in dv)
                    {
                        DataRow row = rv.Row;
                        TableRow tableRow = new TableRow();

                        foreach (string encabezado in encabezados)
                        {
                            TableCell cell = new TableCell();

                            if (row.Table.Columns.Contains(encabezado))
                            {
                                cell.Text = row[encabezado].ToString();
                            }

                            tableRow.Cells.Add(cell);
                        }

                        tabla.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertScript", $"alert('Error');", true);
            }
        }

        protected void DropDownListElimCuen_SelectedIndexChanged(object sender, EventArgs e)
        {
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);


        }

        protected void DropDownListCuenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);
        }

       

        protected void DropDownListElimReg_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            
        }

        protected void EditarRegistro_Click(object sender, EventArgs e)
        {
            sqlDataSource2.Update();
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);
        }

        protected void EditarCuenta_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            CompletarTabla(Table1, SqlDSTabla1, encabezados1);
            CompletarTabla(Table2, SqlDSTabla2, encabezados2);
        }
    }
}