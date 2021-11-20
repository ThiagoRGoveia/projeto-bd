exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query } = req.query
    const response = await repository.execute(loadQueries[query])
    res.status(200).send(response)
    res.end()
  }
})
