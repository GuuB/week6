# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each { |candidate|
    if candidate[:id].to_i == id
      return candidate
    end
  }
  return nil
end

def ordered_by_qualification(candidates)
  candidates.sort_by! { |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  }
  # return candidates
end

def qualified_candidates(candidates)
  good = []
  candidates.each { |candidate|
    if experienced?(candidate)
      if github_points?(candidate)
        if knows_ruby?(candidate) || knows_python?(candidate)
          if applied_recently?(candidate)
            if over_18?(candidate)
              good << candidate
            end
          end
        end
      end
    end
  }
end

def experienced?(candidate)
  candidate[:years_of_experience].to_i >= 2
end

def github_points?(candidate)
  candidate[:github_points].to_i >= 100
end

def knows_ruby?(candidate)
  candidate[:languages].include?('Ruby')
end

def knows_python?(candidate)
  candidate[:languages].include?('Python')
end

def applied_recently?(candidate)
  candidate[:date_applied] - 15.days.ago.to_date > 0
end

def over_18?(candidate)
  candidate[:age].to_i >= 18
end
