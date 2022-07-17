const helper = async (victim: any, attacker: any) => {
  let count = 0;

  while (count < 10) {
    await attacker.hackContract();
    count++;
  }
};

export default helper;
