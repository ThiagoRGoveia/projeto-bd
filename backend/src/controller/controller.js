exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query, params } = req.query
    console.log(query)
    const response = await repository.execute(loadQueries[query], params)
    console.log(response)
    res.status(200).send(response)
    res.end()
  }
})
