require_relative 'news.rb'

class NewsAUJSONFormatter < News::Formatter

	# Call super to guarantee that our checks are run
	def initialize
		super
	end

	# Define dummy extension type
	def extension
		"json"
	end

	# Return true for header
	def header?
		true
	end

	def footer?
		true
	end

	def header article
		"{\"articles\":\n"
	end

	# Return canned article representation
	def article_representation article
		"{ \"title\": \"#{article.title}\", \"description\":\"#{article.summary.slice(1..15)}...\"},"
	end

	def footer article
		"{}, }"
	end
end

