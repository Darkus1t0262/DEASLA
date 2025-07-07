using System.Collections.Generic;
using System.Threading.Tasks;
using TemplateService.Models;

namespace TemplateService.Services
{
    public interface ITemplateService
    {
        Task<List<Template>> GetAllAsync();
        Task<Template> GetByIdAsync(string id);
        Task<Template> CreateAsync(Template template);
        Task<bool> DeleteAsync(string id);
    }
}
