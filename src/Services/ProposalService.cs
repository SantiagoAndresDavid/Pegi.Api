using Data.Repository;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ProposalService
{
    private readonly ProposalRepository _proposalRepository;

    public ProposalService(ProposalRepository proposalRepository)
    {
        _proposalRepository = proposalRepository;
    }

    public (string, bool) SaveProposal(Proposal proposal)
    {
        try
        {
            _proposalRepository.Save(proposal);
            return ("se ha guardado con exito", true);
        }
        catch (ProposalExeption e)
        {
            return (e.Message, false);
        }
    }

    public (string, bool?) UpdateProposal(Proposal proposal)
    {
        try
        {
            _proposalRepository.Update(proposal);
            return ("se actualizo con exito", true);
        }
        catch (AuthException e)
        {
            return ("error", false);
        }
    }

    public List<Proposal> GetProposalsDocument(string personDocument)
    {
        return _proposalRepository.Filter(proposal =>
            proposal.PersonDocument != null &&
            proposal.PersonDocument == personDocument);
    }


    public List<Proposal> GetAll()
    {
        return _proposalRepository.GetAll();
    }

    public string DeleteProposal(string code)
    {
        try
        {
            Proposal? proposal =
                _proposalRepository.Find(proposal => proposal.Code == code);
            _proposalRepository.Delete(proposal!);
            return "se borro con exito";
        }
        catch (Exception e)
        {
            throw new PersonExeption(
                $"Ha ocurrido un error al eliminar {e.Message}");
        }
    }   

    public Proposal? GetProposalCode(string code)
    {
        return _proposalRepository.Find(proposal => proposal.Code == code);
    }
}
