import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import LilypadTokenModule from "./LilypadTokenModule";
import LilypadStorageModule from "./LilypadStorageModule";
import LilypadMediationModule from "./LilypadMediationModule";
import LilypadUsersModule from "./LilypadUsersModule";
import LilypadPaymentsModule from "./LilypadPaymentsModule";
import LilypadOnChainJobCreatorModule from "./LilypadOnChainJobCreatorModule";

export default buildModule("LilypadControllerModule", (m) => {
  const admin = m.getAccount(0);

  const { token } = m.useModule(LilypadTokenModule);
  const { storage } = m.useModule(LilypadStorageModule);
  const { mediation } = m.useModule(LilypadMediationModule);
  const { users } = m.useModule(LilypadUsersModule);
  const { payments } = m.useModule(LilypadPaymentsModule);
  const { jobCreator } = m.useModule(LilypadOnChainJobCreatorModule);

  const controller = m.contract("LilypadController", [], {
    from: admin,
  });

  m.call(controller, "initialize", [storage, mediation, users, payments, jobCreator], {
    from: admin,
  });

  m.call(storage, "setControllerAddress", [controller], {
    from: admin,
  });

  m.call(payments, "setControllerAddress", [controller], {
    from: admin,
  });

  m.call(mediation, "setControllerAddress", [controller], {
    from: admin,
  });

  // transfer some tokens to the solver
  /*
  const faucet = m.getAccount(1);
  const solver = m.getAccount(2);
  const mediator = m.getAccount(3);
  const resource_provider = m.getAccount(4);
  const job_creator = m.getAccount(5);
  const directory = m.getAccount(6);
  m.call(token, "transfer", [faucet, "100000000000000000000000000"], {
    from: admin,
  });
  
  m.call(token, "transfer", [solver, "10000000000000000000000000"], {
    from: faucet,
  });
  m.call(token, "transfer", [mediator, "10000000000000000000000000"], {
    from: faucet,
  });
  m.call(token, "transfer", [resource_provider, "10000000000000000000000000"], {
    from: faucet,
  });
  m.call(token, "transfer", [job_creator, "10000000000000000000000000"], {
    from: faucet,
  });
  m.call(token, "transfer", [directory, "10000000000000000000000000"], {
    from: faucet,
  });
  */

  return { controller };
});