using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;

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

public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
{
    private protected readonly PegiDbContext Context;

    public Repository(PegiDbContext context)
    {
        Context = context;
    }

    public void Save(TEntity entity)
    {
        Context.Set<TEntity>().Add(entity);
        Context.SaveChanges();
    }

    public bool HasAny(Expression<Func<TEntity, bool>> predicate)
    {
        return Context.Set<TEntity>().Any(predicate);
    }

    public virtual TEntity? Find(Expression<Func<TEntity, bool>> predicate)
    {
        return Context.Set<TEntity>().AsNoTracking().FirstOrDefault(predicate);
    }

    public virtual List<TEntity> Filter(
        Expression<Func<TEntity, bool>> predicate)
    {
        return Context.Set<TEntity>().Where(predicate).ToList();
    }

    public virtual List<TEntity> GetAll()
    {
        return Context.Set<TEntity>().AsNoTracking().ToList();
    }

    public void Delete(TEntity entity)
    {
        Context.Set<TEntity>().Remove(entity);
        Context.SaveChanges();
    }

    public void Update(TEntity entity)
    {
        Context.Set<TEntity>().Update(entity);
        Context.SaveChanges();
    }
}
