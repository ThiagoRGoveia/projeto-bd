exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query, params } = req.query
    const response = await repository.execute(loadQueries[query], params)
    res.status(200).send(response)
    res.end()
  }
})
