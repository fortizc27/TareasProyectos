using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BD;
using Entity;

namespace WBL
{
    public interface IInquilinoService
    {
        Task<DBEntity> Create(InquilinoEntity entity);
        Task<DBEntity> Delete(InquilinoEntity entity);
        Task<IEnumerable<InquilinoEntity>> Get();
        Task<InquilinoEntity> GetById(InquilinoEntity entity);
        Task<DBEntity> Update(InquilinoEntity entity);
    }

    public class InquilinoService : IInquilinoService
    {
        private readonly IDataAccess sql;

        public InquilinoService(IDataAccess _sql)
        {
            sql = _sql;
        }

        #region MetodosCrud

        //Get
        public async Task<IEnumerable<InquilinoEntity>> Get()
        {
            try
            {
                var result = sql.QueryAsync<InquilinoEntity>("dbo.TI_Obtener");

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //GetById
        public async Task<InquilinoEntity> GetById(InquilinoEntity entity)
        {
            try
            {
                var result = sql.QueryFirstAsync<InquilinoEntity>("dbo.TI_Obtener", new { entity.Id_TipoInquilino });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Create
        public async Task<DBEntity> Create(InquilinoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.TI_Insertar", new
                {
                    entity.Descripcion,
                    entity.Estado
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Update
        public async Task<DBEntity> Update(InquilinoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.TI_Actualizar", new
                {
                    entity.Id_TipoInquilino,
                    entity.Descripcion,
                    entity.Estado
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Delete
        public async Task<DBEntity> Delete(InquilinoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("dbo.TI_Eliminar", new
                {
                    entity.Id_TipoInquilino
                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
    }
}
