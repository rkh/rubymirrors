module Ruby
  class Reflection
    class Mirror
      include AbstractReflection::Mirror

      private
      def mirrors(list)
        list.collect {|each| Mirror.reflect each }
      end
    end
  end
end
