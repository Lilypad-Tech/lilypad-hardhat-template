import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import {
  DEFAULT_TOKEN_SUPPLY,
} from '../../utils/constants'

export default buildModule("LilypadTokenModule", (m) => {
  const admin = m.getAccount(0);
  const token = m.contract("LilypadToken", ["Lilypad Token", "LP", DEFAULT_TOKEN_SUPPLY], {
    from: admin,
  });
  console.log(`Deployed token contract at ${token}, from ${admin}`);
  return { token };
});