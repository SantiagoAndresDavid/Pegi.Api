using System.Linq.Expressions;

namespace Data.Repository.shared;

public interface IRepository<TEntity> where TEntity : class
{
    void Save(TEntity entity);
    bool HasAny(Expression<Func<TEntity, bool>> predicate);
    TEntity? Find(Expression<Func<TEntity, bool>> predicate);

    List<TEntity> Filter(
        Expression<Func<TEntity, bool>> predicate);

    List<TEntity> GetAll();
    void Delete(TEntity entity);
    void Update(TEntity entity);
}

