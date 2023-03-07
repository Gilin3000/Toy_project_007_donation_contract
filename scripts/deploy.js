async function main() {
  const Fundraising = await ethers.getContractFactory("Fundraising");
  const contract = await Fundraising.deploy(ethers.utils.parseEther("10.0"));
  console.log("Contract address is: ", contract.address);
}

main().then(() => process.exit(0).catch((error) => {
  console.error(error);
  process.exit(1);
}))