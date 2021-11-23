exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query, params } = req.query
    console.log(query)
    console.log(params)
    const response = await repository.execute(loadQueries[query], params)
    // console.log(response)
    res.status(200).send(response)
    res.status(200)
    res.end()
  }
})
