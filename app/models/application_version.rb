class ApplicationVersion < ActiveRecord
  include PaperTrail::VersionConcern
  self.abstract_class = true
end