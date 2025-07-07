using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ScheduleService.Models;

namespace ScheduleService.Services
{
    public interface IScheduleService
    {
        Task<List<Schedule>> GetAllAsync();
        Task<Schedule> GetByIdAsync(Guid id);
        Task<Schedule> CreateAsync(Schedule schedule);
        Task<bool> DeleteAsync(Guid id);
    }
}