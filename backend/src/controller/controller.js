exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query, params, sort, filter } = req.query
    let order, filterObj
    if (sort) {
      order = {
        col: sort[0],
        direction: sort[1]
      }
    }
    if (filter) {
      filterObj = {
        col: filter[0],
        value: filter[1]
      }
    }
    const response = await repository.execute({ query: loadQueries[query], params, order, filter: filterObj })
    res.status(200).send(response)
    res.status(200)
    res.end()
  }
})
