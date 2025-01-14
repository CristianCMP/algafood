ALTER TABLE forma_pagamento ADD data_atualizacao TIMESTAMP NULL;
UPDATE forma_pagamento SET data_atualizacao = CURRENT_TIMESTAMP;
ALTER TABLE forma_pagamento ALTER COLUMN data_atualizacao SET NOT NULL;
