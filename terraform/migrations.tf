# 20260111_233200 move_kids_group
moved {
  from = pocketid_group.kids
  to   = module.groups["kids"].pocketid_group.main
}

# 20260112_000400 import_existing_groups
import {
  to = module.groups["filebrowser-admins"].pocketid_group.main
  id = "6693c447-337c-4e94-9f9f-b97a786c5d56"
}

import {
  to = module.groups["filebrowser-users"].pocketid_group.main
  id = "1330e57c-26cd-4f8d-b33b-2b7ed42d3e5d"
}

import {
  to = module.groups["secret-admins"].pocketid_group.main
  id = "9a8b7767-beaf-42da-a19c-44de3dbe88cc"
}

import {
  to = module.groups["secret-users"].pocketid_group.main
  id = "b0471310-6ee2-4591-bf66-29e8aacda8d2"
}

# 20260113_003400 import_existing_clients
import {
  to = module.clients["filebrowser"].pocketid_client.main
  id = "6972cd97-89dd-414d-8655-ebee4e278149"
}

# 20260113_233800 import_existing_clients
import {
  to = module.clients["grafana"].pocketid_client.main
  id = "984f08f0-4ba6-4ed1-a18c-301d6faad78f"
}

import {
  to = module.clients["jellyfin"].pocketid_client.main
  id = "ae9ca197-ebf5-43ed-966e-9df6622e67b0"
}

import {
  to = module.clients["openbao"].pocketid_client.main
  id = "1c71b01f-6bff-4394-ac10-342e5ea1ff82"
}

import {
  to = module.groups["grafana-admins"].pocketid_group.main
  id = "13e2c6a9-7290-43a5-870d-f4e0b8e2dbbe"
}
