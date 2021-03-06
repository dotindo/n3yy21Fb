﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DotWeb.Models
{
    public partial class Brand
    {
        public Brand()
        {
            ToolSetups = new HashSet<ToolSetup>();
        }
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public virtual ICollection<ToolSetup> ToolSetups { get; set; }
    }
}
