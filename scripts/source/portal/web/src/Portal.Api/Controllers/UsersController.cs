using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Portal.Data;
using Portal.Data.Entities;

namespace Portal.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly ILogger<UsersController> _logger;
        private readonly PortalContext _context;

        public UsersController(ILogger<UsersController> logger, PortalContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet]
        public User Get()
        {
            var user = _context.Users.SingleOrDefault(u => u.Id == Guid.NewGuid());

            return user;
        }
    }
}
