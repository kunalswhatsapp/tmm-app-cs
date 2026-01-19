using System;
using System.Collections.Generic;
using System.Linq;

namespace CatalystFacade
{
    public abstract class MappingTable<TMapClass, TKey, TValue> where TMapClass : new()
    {

        public static TMapClass Map = new TMapClass();

        private readonly Dictionary<TKey, TValue> _dictionary = new Dictionary<TKey, TValue>();

        protected MappingTable()
        {
            Fill();
        }

        protected abstract void Fill();

        protected void Add(TKey obj1, TValue obj2)
        {
            _dictionary.Add(obj1, obj2);
        }

        public TKey MapValueToKey(TValue value)
        {
            if(!HasKeyForValue(value))
            {
                throw new ArgumentException(String.Format("{0} is not supported for mapping", value));
            }
            return _dictionary.First((p) => EqualityComparer<TValue>.Default.Equals(p.Value,value)).Key;
        }

        public TValue MapKeyToValue(TKey key)
        {
            if(!HasValueForKey(key))
            {
                throw new ArgumentException(String.Format("{0} is not supported for mapping", key));
            } 
            return _dictionary[key];
        }

        public bool HasValueForKey(TKey key)
        {
            return _dictionary.ContainsKey(key);
        }

        public bool HasKeyForValue(TValue value)
        {
            return _dictionary.ContainsValue(value);
        }
    }
}
