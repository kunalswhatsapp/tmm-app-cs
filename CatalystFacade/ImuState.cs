using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CatalystFacade
{
    public enum ImuState
    {
        NotAvailable,
        NeedsMovement,
        Running,
        ErrorHasBeenDetected,
        ExcessiveBiasHasBeenDetected
    }
}