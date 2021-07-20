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
    public class ProfilesController : ControllerBase
    {
        private readonly ILogger<ProfilesController> _logger;
        private readonly PortalContext _context;

        public ProfilesController(ILogger<ProfilesController> logger, PortalContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet]
        public Profile Get()
        {
            var profile = _context.Profiles.SingleOrDefault(u => u.UserId == Guid.NewGuid());

            return profile;
        }
    }
}
