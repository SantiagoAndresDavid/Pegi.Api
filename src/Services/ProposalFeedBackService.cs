using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ProposalFeedBackService
{
    private readonly IRepository<ProposalFeedBack> _proposalFeedBackRepository;

    public ProposalFeedBackService(IRepository<ProposalFeedBack> proposalFeedBackRepository)
    {
        _proposalFeedBackRepository = proposalFeedBackRepository;
    }

    public (string, bool) SaveProposalFeedBack(ProposalFeedBack proposalFeedBack)
    {
        try
        {
            _proposalFeedBackRepository.Save(proposalFeedBack);
            return ("se ha guardado con exito", true);
        }
        catch (ProposalFeedBackExeption e)
        {
            return (e.Message, false);
        }
    }


}
