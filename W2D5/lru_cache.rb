class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if count < @size
      short_cache_operation(el)
    else
      full_cache_operation(el)
    end
  end

  def show
    print @cache
  end

  private

  def update(el)
    @cache.delete(el)
    @cache << el
  end

  def short_cache_operation(el)
    @cache.include?(el) ? update(el) : @cache << el
  end

  def full_cache_operation(el)
    if @cache.include?(el)
      update(el)
    else
      @cache.shift
      @cache << el
    end
  end
end
