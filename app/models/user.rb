class User < ApplicationRecord
has_one: bio
has_many: comments
has_many: posts
end
