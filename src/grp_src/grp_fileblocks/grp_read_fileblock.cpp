#include <inttypes.h>
#include <string.h>

#include "core.h"
#include "daal.h"
#include "devtools.h"
#include "fileblocks.h"

namespace sofs20 {
void grpReadFileBlock(int ih, uint32_t fbn, void* buf) {
  soProbe(331, "%s(%d, %u, %p)\n", __FUNCTION__, ih, fbn, buf);
  //reads the data block
  uint32_t current_data_block = soGetFileBlock(ih, fbn);
  if (current_data_block != BlockNullReference)
    soReadDataBlock(current_data_block, buf);
  else
    memset(buf, 0, BlockSize);
}
};  // namespace sofs20
