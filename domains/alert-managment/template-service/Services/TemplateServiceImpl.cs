using System.Collections.Generic;
using System.Threading.Tasks;
using MongoDB.Driver;
using TemplateService.Data;
using TemplateService.Models;

namespace TemplateService.Services
{
    public class TemplateServiceImpl : ITemplateService
    {
        private readonly IMongoCollection<Template> _templates;

        public TemplateServiceImpl(MongoContext context)
        {
            _templates = context.Templates;
        }

        public async Task<List<Template>> GetAllAsync()
        {
            return await _templates.Find(_ => true).ToListAsync();
        }

        public async Task<Template> GetByIdAsync(string id)
        {
            return await _templates.Find(t => t.Id == id).FirstOrDefaultAsync();
        }

        public async Task<Template> CreateAsync(Template template)
        {
            await _templates.InsertOneAsync(template);
            return template;
        }

        public async Task<bool> DeleteAsync(string id)
        {
            var result = await _templates.DeleteOneAsync(t => t.Id == id);
            return result.DeletedCount > 0;
        }
    }
}
