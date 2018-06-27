# type Query {
#   hero: Character
#   human(id: String!): Human
#   droid(id: String!): Droid
# }
module Types
  class QueryType < Types::BaseObject
    description "The query root for this schema"

    # You can define fields on the fly:
    field :hero, CharacterInterface, description: "The hero of the saga", null: false do
      argument :episode, EpisodeEnum, "If provided, return the hero of that episode", required: false
    end

    def hero(**args)
      args[:episode] == 5 ? Human.find(1000) : Droid.find(2001)
    end

    field :human, HumanType, field: Fields::FetchField.build(type: HumanType, model: Human), null: true
    field :droid, DroidType, field: Fields::FetchField.build(type: DroidType, model: Droid), null: true
    field :node, field: GraphQL::Relay::Node.field, null: true
  end
end
