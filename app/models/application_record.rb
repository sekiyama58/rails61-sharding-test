class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    group1: { writing: :group1 },
    group2: { writing: :group2 },
  }
end
