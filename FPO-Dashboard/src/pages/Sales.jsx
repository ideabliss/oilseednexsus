import { useState } from 'react'

export default function Sales() {
  const [activeTab, setActiveTab] = useState('domestic')
  
  const domesticBuyers = [
    { id: 'DB001', name: 'Reliance Retail', type: 'Retail Chain', location: 'Mumbai', crops: ['Soybean', 'Mustard'], rating: 4.8, lastOrder: '2024-01-15' },
    { id: 'DB002', name: 'Big Basket', type: 'E-commerce', location: 'Bangalore', crops: ['Groundnut', 'Sunflower'], rating: 4.6, lastOrder: '2024-01-10' },
    { id: 'DB003', name: 'ITC Limited', type: 'FMCG', location: 'Kolkata', crops: ['Soybean', 'Mustard'], rating: 4.9, lastOrder: '2024-01-20' },
  ]

  const exportBuyers = [
    { id: 'EB001', name: 'Global Agri Corp', country: 'USA', type: 'Trading Company', crops: ['Soybean', 'Groundnut'], volume: '500+ tons', certification: 'Organic' },
    { id: 'EB002', name: 'Euro Foods Ltd', country: 'Germany', type: 'Food Processor', crops: ['Mustard', 'Sunflower'], volume: '300+ tons', certification: 'EU Organic' },
    { id: 'EB003', name: 'Asia Pacific Trading', country: 'Japan', type: 'Importer', crops: ['Soybean'], volume: '1000+ tons', certification: 'JAS Organic' },
  ]

  const industrialBuyers = [
    { id: 'IB001', name: 'Hindustan Unilever', type: 'Oil Processing', location: 'Mumbai', crops: ['Groundnut', 'Sunflower'], capacity: '2000 tons/month' },
    { id: 'IB002', name: 'Adani Wilmar', type: 'Oil Refinery', location: 'Ahmedabad', crops: ['Soybean', 'Mustard'], capacity: '5000 tons/month' },
    { id: 'IB003', name: 'Ruchi Soya', type: 'Food Processing', location: 'Indore', crops: ['Soybean'], capacity: '3000 tons/month' },
  ]

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-green-600 to-blue-600 rounded-2xl p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">Sales & Export Hub</h1>
        <p className="text-white/90">Connect with domestic retailers, international exporters, and industrial processors</p>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200">
        <nav className="-mb-px flex space-x-8">
          {[
            { id: 'domestic', name: 'Domestic Sales', icon: '🏪' },
            { id: 'export', name: 'International Export', icon: '🌍' },
            { id: 'industrial', name: 'Industrial Processing', icon: '🏭' }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`py-3 px-1 border-b-2 font-semibold text-sm flex items-center space-x-2 ${
                activeTab === tab.id
                  ? 'border-blue-500 text-blue-600'
                  : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
              }`}
            >
              <span>{tab.icon}</span>
              <span>{tab.name}</span>
            </button>
          ))}
        </nav>
      </div>

      {/* Domestic Sales */}
      {activeTab === 'domestic' && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {domesticBuyers.map((buyer) => (
            <div key={buyer.id} className="bg-white rounded-2xl shadow-lg p-6 border border-gray-100 hover:shadow-xl transition-all duration-300">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-bold text-gray-900">{buyer.name}</h3>
                <span className="bg-green-100 text-green-800 px-2 py-1 rounded-full text-xs font-bold">
                  ⭐ {buyer.rating}
                </span>
              </div>
              <div className="space-y-2 mb-4">
                <p className="text-sm text-gray-600"><span className="font-medium">Type:</span> {buyer.type}</p>
                <p className="text-sm text-gray-600"><span className="font-medium">Location:</span> {buyer.location}</p>
                <p className="text-sm text-gray-600"><span className="font-medium">Last Order:</span> {buyer.lastOrder}</p>
              </div>
              <div className="mb-4">
                <p className="text-sm font-medium text-gray-700 mb-2">Interested Crops:</p>
                <div className="flex flex-wrap gap-1">
                  {buyer.crops.map((crop) => (
                    <span key={crop} className="bg-blue-100 text-blue-800 px-2 py-1 rounded-full text-xs font-medium">
                      {crop}
                    </span>
                  ))}
                </div>
              </div>
              <button className="w-full bg-gradient-to-r from-green-500 to-green-600 text-white py-2 px-4 rounded-xl hover:from-green-600 hover:to-green-700 transition-all duration-300 font-semibold">
                Contact Buyer
              </button>
            </div>
          ))}
        </div>
      )}

      {/* International Export */}
      {activeTab === 'export' && (
        <div className="space-y-6">
          <div className="bg-blue-50 rounded-2xl p-6 border border-blue-200">
            <h2 className="text-xl font-bold text-blue-900 mb-2">🌍 Export Requirements</h2>
            <p className="text-blue-700 mb-4">Ensure your crops meet international standards and certifications</p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">📋 Documentation</h3>
                <p className="text-sm text-gray-600">Export license, phytosanitary certificate</p>
              </div>
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">🏆 Quality Standards</h3>
                <p className="text-sm text-gray-600">Organic, Non-GMO, pesticide-free</p>
              </div>
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">📦 Packaging</h3>
                <p className="text-sm text-gray-600">Export-grade packaging & labeling</p>
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {exportBuyers.map((buyer) => (
              <div key={buyer.id} className="bg-white rounded-2xl shadow-lg p-6 border border-gray-100 hover:shadow-xl transition-all duration-300">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="text-lg font-bold text-gray-900">{buyer.name}</h3>
                  <span className="bg-blue-100 text-blue-800 px-2 py-1 rounded-full text-xs font-bold">
                    🌍 {buyer.country}
                  </span>
                </div>
                <div className="space-y-2 mb-4">
                  <p className="text-sm text-gray-600"><span className="font-medium">Type:</span> {buyer.type}</p>
                  <p className="text-sm text-gray-600"><span className="font-medium">Volume:</span> {buyer.volume}</p>
                  <p className="text-sm text-gray-600"><span className="font-medium">Certification:</span> {buyer.certification}</p>
                </div>
                <div className="mb-4">
                  <p className="text-sm font-medium text-gray-700 mb-2">Required Crops:</p>
                  <div className="flex flex-wrap gap-1">
                    {buyer.crops.map((crop) => (
                      <span key={crop} className="bg-green-100 text-green-800 px-2 py-1 rounded-full text-xs font-medium">
                        {crop}
                      </span>
                    ))}
                  </div>
                </div>
                <button className="w-full bg-gradient-to-r from-blue-500 to-blue-600 text-white py-2 px-4 rounded-xl hover:from-blue-600 hover:to-blue-700 transition-all duration-300 font-semibold">
                  Export Inquiry
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Industrial Processing */}
      {activeTab === 'industrial' && (
        <div className="space-y-6">
          <div className="bg-purple-50 rounded-2xl p-6 border border-purple-200">
            <h2 className="text-xl font-bold text-purple-900 mb-2">🏭 Industrial Processing</h2>
            <p className="text-purple-700 mb-4">Supply to oil mills, food processors, and manufacturing units</p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">⚙️ Oil Extraction</h3>
                <p className="text-sm text-gray-600">Soybean, groundnut, sunflower oil</p>
              </div>
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">🍽️ Food Processing</h3>
                <p className="text-sm text-gray-600">Snacks, ready-to-eat products</p>
              </div>
              <div className="bg-white rounded-xl p-4">
                <h3 className="font-semibold text-gray-900">🧪 Industrial Use</h3>
                <p className="text-sm text-gray-600">Biodiesel, cosmetics, pharmaceuticals</p>
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {industrialBuyers.map((buyer) => (
              <div key={buyer.id} className="bg-white rounded-2xl shadow-lg p-6 border border-gray-100 hover:shadow-xl transition-all duration-300">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="text-lg font-bold text-gray-900">{buyer.name}</h3>
                  <span className="bg-purple-100 text-purple-800 px-2 py-1 rounded-full text-xs font-bold">
                    🏭 Industrial
                  </span>
                </div>
                <div className="space-y-2 mb-4">
                  <p className="text-sm text-gray-600"><span className="font-medium">Type:</span> {buyer.type}</p>
                  <p className="text-sm text-gray-600"><span className="font-medium">Location:</span> {buyer.location}</p>
                  <p className="text-sm text-gray-600"><span className="font-medium">Capacity:</span> {buyer.capacity}</p>
                </div>
                <div className="mb-4">
                  <p className="text-sm font-medium text-gray-700 mb-2">Processing Crops:</p>
                  <div className="flex flex-wrap gap-1">
                    {buyer.crops.map((crop) => (
                      <span key={crop} className="bg-orange-100 text-orange-800 px-2 py-1 rounded-full text-xs font-medium">
                        {crop}
                      </span>
                    ))}
                  </div>
                </div>
                <button className="w-full bg-gradient-to-r from-purple-500 to-purple-600 text-white py-2 px-4 rounded-xl hover:from-purple-600 hover:to-purple-700 transition-all duration-300 font-semibold">
                  Submit Proposal
                </button>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}