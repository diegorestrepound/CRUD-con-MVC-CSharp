using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Modelo;

namespace Controlador
{
    public class ClsContactoMgr
    {
        ClsDatos cnGeneral = null;
        ClsContacto objContacto = null;
        DataTable tblDatos = null;

        public ClsContactoMgr(ClsContacto parObjEmpleado)
        {
            objContacto = parObjEmpleado;
        }

        public DataTable Listar()
        {
            tblDatos = new DataTable();
            try
            {
                cnGeneral = new ClsDatos();
                SqlParameter[] parParameter = new SqlParameter[1];
                parParameter[0] = new SqlParameter();
                parParameter[0].ParameterName = "@opc";
                parParameter[0].SqlDbType = SqlDbType.Int;
                parParameter[0].SqlValue = objContacto.opc;
                tblDatos = cnGeneral.RetornaTabla(parParameter, "SPContacto");
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return tblDatos;
        }

        public void GuardarDatos()
        {
            try
            {
                cnGeneral = new ClsDatos();
                SqlParameter[] parameters = new SqlParameter[6];
                parameters[0] = new SqlParameter();
                parameters[0].ParameterName = "@opc";
                parameters[0].SqlDbType = SqlDbType.Int;
                parameters[0].SqlValue = objContacto.opc;

                parameters[1] = new SqlParameter();
                parameters[1].ParameterName = "@Cedula";
                parameters[1].SqlDbType = SqlDbType.Int;
                parameters[1].SqlValue = objContacto.Cedula;

                parameters[2] = new SqlParameter();
                parameters[2].ParameterName = "@Nombre";
                parameters[2].SqlDbType = SqlDbType.VarChar;
                parameters[2].Size = 50;
                parameters[2].SqlValue = objContacto.Nombre;


                parameters[3] = new SqlParameter();
                parameters[3].ParameterName = "@Apellido";
                parameters[3].SqlDbType = SqlDbType.VarChar;
                parameters[3].Size = 50;
                parameters[3].SqlValue = objContacto.Apellido;

                parameters[4] = new SqlParameter();
                parameters[4].ParameterName = "@Fecha_nacimiento";
                parameters[4].SqlDbType = SqlDbType.Date;
               // parameters[4].Size = 20;
                parameters[4].SqlValue = objContacto.FechaNacimiento;

                parameters[5] = new SqlParameter();
                parameters[5].ParameterName = "@Cargo";
                parameters[5].SqlDbType = SqlDbType.TinyInt;
              //  parameters[5].Size = 20;
                parameters[5].SqlValue = objContacto.Cargo;

                cnGeneral.EjecutarSP(parameters, "SPContacto");
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        }

        public void ElinminarDatos()
        {
            try
            {
                cnGeneral = new ClsDatos();
                SqlParameter[] parameters = new SqlParameter[2];

                parameters[0] = new SqlParameter();
                parameters[0].ParameterName = "@opc";
                parameters[0].SqlDbType = SqlDbType.Int;
                parameters[0].SqlValue = objContacto.opc;

                parameters[1] = new SqlParameter();
                parameters[1].ParameterName = "@Cedula";
                parameters[1].SqlDbType = SqlDbType.Int;
                parameters[1].SqlValue = objContacto.Cedula;


            }
            catch (Exception e)
            {
                throw new Exception(e.Message);

            }
        }

    }
}
