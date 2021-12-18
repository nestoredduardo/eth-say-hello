const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners()
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal")
  const waveContract = await waveContractFactory.deploy()
  await waveContract.deployed()

  console.log("Contract deployed to:", waveContract.address)
  console.log("Contract deployed by:", owner.address)

  let waveCount = await waveContract.getTotalWaves()

  let waveTxn = await waveContract.wave("Nestor", "Hello Peter", 8)
  await waveTxn.wait()
  waveCount = await waveContract.getTotalWaves()

  waveTxn = await waveContract.wave("Nestor", "Hello Peter", 1)
  await waveTxn.wait()
  waveCount = await waveContract.getTotalWaves()

  const partnerList = await waveContract.getPartnerList()
  console.log(partnerList)
}

const runMain = async () => {
  try {
    await main()
    process.exit(0)
  } catch (error) {
    console.log(error)
    process.exit(1)
  }
}

runMain()
