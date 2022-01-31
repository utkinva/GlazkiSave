using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GlazkiSave.Entities;
using System.Windows.Controls;

namespace GlazkiSave.Utilities
{
    internal class Transition
    {
        public static Frame mainFrame { get; set; }
        private static GlazkiEntities _context { get; set; }
        public static GlazkiEntities Context
        {
            get
            {
                if (_context == null)
                    _context = new GlazkiEntities();
                return _context;
            }
        }
    }
}
