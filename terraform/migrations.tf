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

import {
  to = module.users["admin"].pocketid_user.main
  id = "d7116ece-0bd1-4b39-b486-becb54a5fb06"
}

import {
  to = module.users["dominik"].pocketid_user.main
  id = "1d0eb3c6-65ba-449f-8005-34f6c1cff245"
}

import {
  to = module.users["jasmin"].pocketid_user.main
  id = "5e623314-34a8-4fa9-a443-e5a6bf5983d7"
}

import {
  to = module.users["nils"].pocketid_user.main
  id = "5666b5a9-35f2-4fa8-a008-63e3d23a6350"
}
import {
  to = module.users["alex"].pocketid_user.main
  id = "524050f4-368c-4dea-9f15-0f07fc4cf26d"
}
